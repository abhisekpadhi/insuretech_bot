# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.views import View
from django.shortcuts import redirect, render
from django.urls import reverse
from django.http import JsonResponse
from django.forms import model_to_dict
from bot.models import *
import json
from bot.tree import Node
from bot.decision import Decider
from pprint import pprint


class Home(View):
    def get(self, request):
        response = {
            "status": "success"
        }
        return JsonResponse(response)


class UserView(View):
    def get(self, request):
        '''
        Retrieves a user.
        :param request: django request object
        :return: JsonResponse
        '''
        queryset = User.objects.filter(email=request.GET.get('email', None))
        if queryset:
            response = [model_to_dict(user) for user in queryset]
            HTTP_STATUS = 200
        else:
            response = {
                "status": "failed",
                "message": "No email provided/User does not exists."
            }
            HTTP_STATUS = 404
        return JsonResponse(response, safe=False, status=HTTP_STATUS)

    def post(self, request):
        '''
        Creates a user.
        Notes:
        Date format: %d-%m-%Y

        :param request: django request object
        :return: JsonResponse
        '''
        jsonData = json.loads(request.body)
        print(jsonData)
        if 'email' not in jsonData.keys():
            status = "failed"
            status_message = "Missing email field."
        elif not User.objects.filter(email=jsonData['email']).exists():
            User(
                email=jsonData['email']
            ).save()
            status = "success"
            status_message = "User created."
        else:
            status = "success"
            status_message = "User already exists."
        # Build response
        response = {
            "status": status,
            "status_message": status_message
        }
        return JsonResponse(response)

    def put(self, request):
        '''
        Updates a user.
        :param request: django request object
        :return: JsonResponse
        '''
        jsonData = json.loads(request.body)
        print(jsonData)
        if 'email' not in jsonData.keys():
            status = "failed"
            status_message = "Email is required to update user."
            HTTP_STATUS = 400
        elif not User.objects.filter(email=jsonData['email']).exists():
            status = "failed"
            status_message = "User does not exists."
            HTTP_STATUS = 404
        else:
            User.objects.filter(email=jsonData['email']).update(
                phone_number=jsonData['phone_number'] if 'phone_number' in jsonData.keys() else None,
                permanent_addr=jsonData['permanent_addr'] if 'permanent_addr' in jsonData.keys() else None,
                current_addr=jsonData['current_addr'] if 'current_addr' in jsonData.keys() else None,
                aadhar_number=jsonData['aadhar_number'] if 'aadhar_number' in jsonData.keys() else None,
                dl_number=jsonData['dl_number'] if 'dl_number' in jsonData.keys() else None,
                birth_certificate_serial=jsonData['birth_certificate_serial'] if 'birth_certificate_serial' in jsonData.keys() else None,
                date_of_birth=jsonData['date_of_birth'] if 'date_of_birth' in jsonData.keys() else None
            )
            status = "success"
            status_message = "User updated."
            HTTP_STATUS = 200
        response = {
            "status": status,
            "status_message": status_message
        }
        return JsonResponse(response, status=HTTP_STATUS)

    def delete(self, request):
        '''
        Deletes a user
        :param request: django request obj
        :return: JsonResponse
        '''
        jsonData = json.loads(request.body)
        print(jsonData)
        if 'email' not in jsonData.keys():
            status = "failed"
            status_message = "Email is required to delete user."
            HTTP_STATUS = 400
        elif not User.objects.filter(email=jsonData['email']).exists():
            status = "failed"
            status_message = "User does not exists."
            HTTP_STATUS = 404
        else:
            User.objects.filter(email=jsonData['email']).delete()
            status = "success"
            status_message = "User deleted."
            HTTP_STATUS = 200
        response = {
            "status": status,
            "status_message": status_message
        }
        return JsonResponse(response, status=HTTP_STATUS)


class ChatView(View):
    def get(self, request):
        '''
        Retrieves chat history
        :param request: django request obj
        :return: JsonResponse
        '''
        print(request.GET.get('email'))
        if not User.objects.filter(email=request.GET.get('email')).exists():
            status = "failed"
            status_message = "user does not exists"
            HTTP_STATUS = 404
            response = {
                "status": status,
                "message": status_message
            }
            return JsonResponse(response, status=HTTP_STATUS)
        else:
            # queryset = Chat.objects.get(user_id=User.objects.get(email=request.GET.get('email')))
            '''Retrieve the chat lines'''
            chat_lines = ChatLine.objects.filter(
                chat_id=Chat.objects.get(user_id=User.objects.get(email=request.GET.get('email')))
            )
            response = [model_to_dict(line) for line in chat_lines]
            HTTP_STATUS = 200
            return JsonResponse(response, safe=False, status=HTTP_STATUS)

    def post(self, request):
        '''
        Create a chat line
        :param request: django request obj
        :return: JsonResponse
        '''
        jsonData = json.loads(request.body)

        '''Insert conditions'''
        # if (('chat_id' in jsonData.keys() and 'email' in jsonData.keys()) and (Chat.objects.filter(id=jsonData['chat_id']).exists() or Chat.objects.filter(user_id=User.objects.get(email=jsonData['email'])).exists())):
        #     '''chat_id and email are given, create a chat_id for the user if not already exist, then insert in chatline'''
        #     '''DB insert'''
        #     print('A got called')
        #     self.chatline_db_insert(jsonData=jsonData)
        #
        #     '''Build response'''
        #     # TODO: Implement
        #
        #     status = "success"
        #     status_message = "inserted in db"
        #     HTTP_STATUS = 200
        #
        # elif ('chat_id' not in jsonData.keys() and 'email' in jsonData.keys() and not Chat.objects.filter(user_id=User.objects.get(email=jsonData['email'])).exists()):
        #     '''chat_id is not given, email is given, chatline does not exists'''
        #     '''DB insert'''
        #     print('B got called')
        #     self.chatline_db_insert(jsonData=jsonData)
        #
        #     '''2. Build response'''
        #     # TODO: Implement
        #
        #     status = "success"
        #     status_message = "inserted in db"
        #     HTTP_STATUS = 200
        #
        # elif ('chat_id' in jsonData.keys() and 'email' not in jsonData.keys() and Chat.objects.filter(id=jsonData['chat_id']).exists()):
        #     '''chat_id is given, email is not given and chatline exists, insert new chatline'''
        #     '''DB Insert'''
        #     self.chatline_db_insert(jsonData=jsonData)
        #
        #     '''2. Build response'''
        #     # TODO: Implement
        #
        #     status = "success"
        #     status_message = "inserted in db"
        #     HTTP_STATUS = 200
        #

        '''Error conditions'''
        if ('chat_id' not in jsonData.keys() and 'email' not in jsonData.keys()):
            status = "failed"
            status_message = "chat_id/email is required"
            HTTP_STATUS = 400

        elif ('chat_id' in jsonData.keys() and not Chat.objects.filter(id=jsonData['chat_id']).exists()):
            status = "failed"
            status_message = "chat not found"
            HTTP_STATUS = 404

        else:
            status = "success"
            if 'email' in jsonData.keys():
                user_id = User.objects.get(email=jsonData['email']).id
            status_message, choices = self.decide_response(
                context={
                    "user_email": jsonData['email'],
                    "user_id": user_id,
                    "selected_node": jsonData.get('selected_node')
                }
            )

            HTTP_STATUS = 200
            self.chatline_db_insert(jsonData=jsonData)

        response = {
            "status": status,
            "message": status_message,
            "choices": choices
        }
        self.chatline_db_insert(
            jsonData={
                "email": jsonData['email'],
                "is_bot": True,
                "line_text": json.dumps(status_message)
            }
        )
        return JsonResponse(response, status=HTTP_STATUS)

    def decide_response(self, context):
        '''
        Given a context, decide the response by traversing the decision tree.
        :param context: dict
        context = {'selected_node': None, 'user_email': 'avicool000@gmail.com', 'user_id': 1}
        :return: string
        '''
        decider = Decider()
        node = Node()
        # pprint(context)
        if decider.is_new_customer(id=context['user_id']):
            '''Go to the root of the tree'''
            response = node.read(is_root=True)

            '''Get list of children'''
            children = node.traverse(
                id=response[0]['id']
            )

            '''Update status'''
            decider.update_or_create(
                user_email=context['user_email'],
                user_id=context['user_id'],
                treenode_title=response[0]['title'],
                treenode_id=response[0]['id']
            )

        else:
            if 'selected_node' not in context or context['selected_node'] is None:
                '''Retrieve the context'''
                status = decider.read(
                    id=context['user_id'],
                )

                '''Resume the flow by traversing to the node from the status'''
                response = node.read(
                    id=status['funnel']['node_id']
                )

                '''Get list of children'''
                children = node.traverse(
                    id=response[0]['id']
                )

            else:
                '''Read current node'''
                response = node.read(
                    id=context['selected_node']
                )

                '''Update context'''
                decider.update_or_create(
                    user_email=context['user_email'],
                    treenode_title=response[0]['title'],
                    treenode_id=context['selected_node']
                )

                if node.is_leaf(id=response[0]['id']):
                    children = None
                else:
                    '''Get list of children'''
                    children = node.traverse(
                        id=response[0]['id']
                    )
        return response, children


    def chatline_db_insert(self, jsonData):
        '''
        Inserts chat messges into db.
        :param jsonData:
        :return:
        '''
        if not Chat.objects.filter(user_id=User.objects.get(email=jsonData['email'])).exists():
            newChat = Chat.objects.create(
                user=User.objects.filter(email=jsonData['email']).first()
            )
            ChatLine.objects.create(
                chat_id=Chat.objects.get(id=newChat.id),
                line_text=jsonData['line_text'],
                is_bot=jsonData['is_bot'] if 'is_bot' in jsonData.keys() else False
             )
        else:
            queryset = Chat.objects.filter(user_id=User.objects.get(email=jsonData['email'])).first() if 'chat_id' not in jsonData.keys() else Chat.objects.filter(id=jsonData['chat_id']).first()
            ChatLine.objects.create(
                chat_id=queryset.id,
                line_text=jsonData['line_text'],
                is_bot=jsonData['is_bot'] if 'is_bot' in jsonData.keys() else False
            )

    def delete(self, request):
        '''
        Delete chat history for a user
        :param request: django request obj
        :return: JsonResponse
        '''
        # TODO: Implement
        status = "success"
        status_message = "Deleted chat history"
        HTTP_STATUS = 200

        jsonData = json.loads(request.body)
        if 'chat_id' in jsonData.keys():
            result = self.delete_chat_history(chat_id=jsonData['chat_id'])

        elif 'chat_id' not in jsonData.keys() and 'email' in jsonData.keys():
            result = self.delete_chat_history(email=jsonData['email'])

        else:
            result = False

        if not result:
            status = "success"
            status_message = "Deleted chat history"
            HTTP_STATUS = 200

        response = {
            "status": status,
            "status_message": status_message
        }
        return JsonResponse(response, HTTP_STATUS)

    def delete_chat_history(self, chat_id=None, email=None):
        '''
        Implements the chat history delete method
        :param chat_id:
        :param email:
        :return:
        '''
        if chat_id is not None:
            if Chat.objects.filter(id=chat_id).exists():
                Chat.objects.filter(id=chat_id).delete()
                return True
            else:
                return False
        if email is not None:
            if User.objects.filter(email=email).exists():
                if Chat.objects.filter(user_id=User.objects.filter(email=email)).exists():
                    Chat.objects.filter(user_id=User.objects.filter(email=email)).delete()
                    return True
            return False