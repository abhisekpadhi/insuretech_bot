from flask import Flask, jsonify, make_response
from flask_restful import Api, Resource, reqparse, fields, marshal
import json, os

app = Flask(__name__, static_url_path="")
api = Api(app)

class HealthCheckAPI(Resource):
    def get(self):
        health = dict()
        health['app'] = {
            'healthy': True
        }
        return make_response(
            jsonify(health),
            200
        )

api.add_resource(HealthCheckAPI, '/health', endpoint='health')

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)