from django.shortcuts import render
from .models import UserModel, ChattingRoom, ChattingRoomUser, Message
from rest_framework.views import APIView


# Create your views here.
# CRUD 작업하는 함수들을 여기서 정의

class CrudMethods(APIView):
    def post(self, request):
        data = request
        print(request)