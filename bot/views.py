# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.shortcuts import render
from django.views import View
from django.shortcuts import redirect, render
from django.urls import reverse
from django.http import JsonResponse
from bot.configs import *
from bot.models import *
import json


class Home(View):
    def get(self, request):
        response = {
            "status": "success"
        }
        return JsonResponse(response)


class UserView(View):
    def get(self, request):
        listOfUsers = User.objects.all()
        context = {
            "listOfUsers":listOfUsers
        }
        return JsonResponse(context)