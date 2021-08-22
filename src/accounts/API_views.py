# from django.http import JsonResponse
# from rest_framework import generics, filters, status
# from rest_framework.permissions import IsAuthenticated
# from rest_framework.response import Response
#
# from accounts.models import Address
# from accounts.serializers import AddressSerializer
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
