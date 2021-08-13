from os import X_OK
from django.http.response import StreamingHttpResponse
from django.views.decorators.http import condition
from django.http import HttpResponse
from django.views.decorators.common import no_append_slash
from datetime import datetime, timedelta


class SimpleMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        requests = request.method 
        response = self.get_response(request)

        user = request.user
        status_code = response.status_code
        time = datetime.now()
        
        with open("Tmart/middleware/middleware.txt",'a+') as f:
            c = ('User:{}\tStatus code:{}\tTime:{}\n'.format(user,status_code,time))
            f.write(c)

        return response
