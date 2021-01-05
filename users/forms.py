from django import forms
from django.contrib.auth import password_validation
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import Profile, Grant
from dal import autocomplete


class UserRegisterForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password1', 'password2']
        labels = {
            'username': 'Имя пользователя',
        }

    email = forms.EmailField()
    first_name = forms.CharField(max_length=100, label='Имя, Очество')
    last_name = forms.CharField(max_length=100, label='Фамилия')
    password1 = forms.CharField(
        label='Пароль',
        strip=False,
        widget=forms.PasswordInput,
        help_text=password_validation.password_validators_help_text_html(),
    )
    password2 = forms.CharField(
        label='Подтверждение пароля',
        widget=forms.PasswordInput,
        strip=False,
        help_text='Повторите пароль для подверждения',
    )


class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']

    def save(self, username, commit=True):
        instance = super(UserUpdateForm, self).save(commit=False)
        instance.username = username
        if commit:
            instance.save()
        return instance


class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['image', 'organization', 'position', 'degree', 'biography', 'link', 'ORCID']
        labels = {
            'image': 'Изображение',
            'organization': 'Организация',
            'position': 'Должность',
            'degree': 'Ученая степень',
            'biography': 'Биография',
            'link': 'Ссылка',
            'ORCID': 'ORCID',
        }
        widgets = {
            'organization': autocomplete.ModelSelect2(url='organization-autocomplete')
        }

    def save(self, user, commit=True):
        instance = super(ProfileUpdateForm, self).save(commit=False)
        instance.user = user
        if commit:
            instance.save()
        return instance


class GrantForm(forms.ModelForm):
    class Meta:
        model = Grant
        fields = ['name', 'year_from', 'year_to', 'fund', 'amount', 'link']

    def save(self, profile, commit=True):
        instance = super(GrantForm, self).save(commit=False)
        instance.profile = profile
        if commit:
            instance.save()
        return instance
