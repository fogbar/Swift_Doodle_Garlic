from django.db import models

# Create your models here.
class UserModel(models.Model):
    user_name = models.CharField(max_length=4)

    class Meta:
        db_table = 'user'

class ChattingRoom(models.Model):
    name = models.CharField(max_length=10)

class ChattingRoomUser(models.Model):
    #ForeignKey가 1:n 일때 n 쪽에 설정을 해줘야만 연결이 되도록 하는 것임. (관계를 생성)
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE, related_name="user")
    chat_room = models.ForeignKey(ChattingRoom, on_delete=models.CASCADE, related_name="chat_room")

    class Meta:
        db_table = "chat_room_user"


class Message(models.Model):
    text = models.CharField(max_length=100)
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE, related_name="user")
    chat_room = models.ForeignKey(ChattingRoom, on_delete=models.CASCADE, related_name="chat_room")

    class Meta:
        db_table = "chat_room"