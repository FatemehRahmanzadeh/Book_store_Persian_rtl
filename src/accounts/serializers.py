from django.contrib.auth import get_user_model
from rest_framework import serializers
from rest_framework.authtoken.models import Token

from accounts.models import Address

User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    """
    Serializer for serializing user fields to a json file
    create method has been overridden to create an unique token for every user
    extra kwargs is used for password to hide its value
    also set_password method is used to save password as hashed data
    """
    class Meta:
        model = User
        fields = ['email', 'password']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = User(email=validated_data['email'])
        user.set_password(validated_data['password'])
        user.save()
        Token.objects.create(user=user)


class AddressSerializer(serializers.ModelSerializer):
    """
    Address serializer to serialize address fields. Because customer field is an user object foreign key,
    UserSerializer should be used for nested serialization. We should set request user as owner of address in view, so
     customer field does not appear in fields list.
    """
    customer = UserSerializer()

    class Meta:
        model = Address
        fields = ['is_default', 'province', 'city', 'street', 'details', 'postcode']
