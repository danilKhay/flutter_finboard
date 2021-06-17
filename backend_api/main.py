from flask import Flask
from flask_restful import reqparse, Api, Resource
from ml_investment.applications.fair_marketcap_sf1 import FairMarketcapSF1
from ml_investment.applications.fair_marketcap_diff_sf1 import FairMarketcapDiffSF1
from ml_investment.applications.marketcap_down_std_sf1 import MarketcapDownStdSF1
from flask_cors import CORS
import requests
import json
from datetime import datetime

app = Flask(__name__)
api = Api(app)
CORS(app)
API_QUANDL = ''

fair_marketcap_sf1 = FairMarketcapSF1()
fair_marketcap_diff_sf1 = FairMarketcapDiffSF1()
marketcap_down = MarketcapDownStdSF1()

marketcap_parser = reqparse.RequestParser()
marketcap_parser.add_argument('ticker', type=str)

downstd_parser = reqparse.RequestParser()
downstd_parser.add_argument('ticker', type=str)
downstd_parser.add_argument('percentile', type=str)


class DailyMarketCap(Resource):
    def get(self):
        args = marketcap_parser.parse_args()
        symbol = args['ticker']
        result = self._request(symbol)
        return result, 200

    @staticmethod
    def _request(symbol):
        params = dict(ticker=symbol, api_key=API_QUANDL)
        response = requests.get('https://www.quandl.com/api/v3/datatables/SHARADAR/DAILY.json', params=params)
        data = json.loads(response.text)
        data = data['datatable']['data']
        result = []
        if len(data) != 0:
            for val in data:
                result.append({'date': val[1], 'marketcap': val[6]})
        return {'data': result}


class FairMarketCap(Resource):
    def get(self):
        args = marketcap_parser.parse_args()
        symbol = args['ticker']
        df = fair_marketcap_sf1.execute([symbol])
        df.reset_index(inplace=True)
        result = []
        df = df[['date', 'fair_marketcap_sf1']].values.tolist()
        if len(df) != 0:
            for val in df:
                result.append({
                    'date': str(datetime.strptime(str(val[0]), '%Y-%m-%d %H:%M:%S').date()),
                    'fair_marketcap': val[1]
                })
        return {
            'data': result
        }, 200


class FairDiffMarketCap(Resource):
    def get(self):
        args = marketcap_parser.parse_args()
        symbol = args['ticker']
        df = fair_marketcap_diff_sf1.execute([symbol])
        df.reset_index(inplace=True)
        result = []
        df = df[['date', 'fair_marketcap_diff_sf1']].values.tolist()
        if len(df) != 0:
            for val in df:
                result.append({
                    'date': str(datetime.strptime(str(val[0]), '%Y-%m-%d %H:%M:%S').date()),
                    'fair_marketcap_via_diff': val[1]
                })
        return {'data': result}, 200


class MarketCapDownStd(Resource):
    def get(self):
        args = downstd_parser.parse_args()
        symbol = args['ticker']
        df = marketcap_down.execute([symbol])
        df.reset_index(inplace=True)
        result = []
        df = df[['date', 'marketcap_down_std_sf1']].values.tolist()
        if len(df) != 0:
            for val in df:
                result.append({
                    'date': str(datetime.strptime(str(val[0]), '%Y-%m-%d %H:%M:%S').date()),
                    'value': val[1]
                })
        return {'data': result}, 200


api.add_resource(DailyMarketCap, '/daily_marketcap')
api.add_resource(FairMarketCap, '/pipelines/fair_marketcap')
api.add_resource(FairDiffMarketCap, '/pipelines/fair_marketcap_via_diff')
api.add_resource(MarketCapDownStd, '/pipelines/down_percentile')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, threaded=True)
