from flask import Flask, jsonify, make_response
from flask_restful import Api, Resource, reqparse, fields, marshal
import json, os
import werkzeug

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

class ArtifactRegister(Resource):
    def __init__(self):
        self.parse = reqparse.RequestParser()
        self.parse.add_argument(
            'picture',
            type=werkzeug.datastructures.FileStorage,
            required=True,
            help='No picture provided',
            location='files'
        )

    def post(self):
        # UPLOAD_FOLDER = 'static/img'
        # data = parser.parse_args()
        # photo = data['file']
        # if data['picture'] != "":
        #     filename = "artifact_abhisek_1"
        #     photo.save(os.path.join(UPLOAD_FOLDER, filename))
        return make_response(
            jsonify({
                "status": "success"
            }),
            200
        )


api.add_resource(HealthCheckAPI, '/health', endpoint='health')
api.add_resource(ArtifactRegister, '/artifact', endpoint='artifact')

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)