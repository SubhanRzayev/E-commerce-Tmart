from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.response import Response
from accounts.api.serializer import RegisterSerializer, UserDetailSerializer
from rest_framework import generics

class CustomAuthToken(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        user_serializer = UserDetailSerializer(user)
        return Response(user_serializer.data, status=200)


class RegisterView(generics.CreateAPIView):
    # queryset = User.objects.all()
    # permission_classes = AllowAny
    serializer_class = RegisterSerializer
    
        
        
