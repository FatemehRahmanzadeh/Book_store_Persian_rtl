# from django.contrib.auth import authenticate
# from django.http import JsonResponse
# from rest_framework import generics, filters
# from rest_framework.permissions import IsAuthenticated
# from rest_framework.response import Response
# from rest_framework.status import HTTP_400_BAD_REQUEST
# from rest_framework.views import APIView
#
# from accounts.serializers import AddressSerializer, UserSerializer
#
#
# class CreateUserAPIView(generics.CreateAPIView):
#     """
#     api view for signup and  user creation view
#     :param: serializer_class: A model serializer defined in accounts.serializer module
#     """
#     serializer_class = UserSerializer()
#
#
# class LoginAPIView(APIView):
#     """
#      api view for user authentication
#     """
#
#     def post(self, request):
#         email = request.data.get('email')
#         password = request.data.get('password')
#         user = authenticate(email=email, password=password)
#         if user:
#             return Response({'token': user.auth_token.key})
#         else:
#             return Response({'error': 'wrong credentials'}, status=HTTP_400_BAD_REQUEST)
#
#
# class AddressListAPIView(generics.ListCreateAPIView):
#     permission_classes = (IsAuthenticated,)
#     serializer_class = AddressSerializer()
#     filter_backends = (filters.SearchFilter,)
#     search_fields = ['postcode']
#
#     def get_queryset(self):
#         return super(AddressListAPIView, self).get_queryset().filter(customer=self.request.user)
#
#     def create(self, request, *args, **kwargs):
#         serializer = self.get_serializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         self.perform_create(serializer)
#         return JsonResponse(data={'ser': serializer.data})
#
#     def get(self, request, *args, **kwargs):
#         return Response(data={'serializer': self.serializer_class})
