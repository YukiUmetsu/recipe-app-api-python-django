from rest_framework import serializers
from basis.models import Tag
from basis.models import Ingredient


class TagSerializer(serializers.ModelSerializer):
    """Serializer for tag Objects"""

    class Meta:
        model = Tag
        fields = ('id', 'name')
        read_only_fields = ('id',)


class IngredientSerializer(serializers.ModelSerializer):
    """Serializer for Ingredient Objects"""

    class Meta:
        model = Ingredient
        fields = ('id', 'name')
        read_only_fields = ('id',)
