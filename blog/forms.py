from django import forms

from users.models import Organization
from .models import Comment, Post
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Layout


class FilterForm(forms.Form):
    author = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Автор'}), label='',
                             max_length=300,
                             required=False)
    content = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Ключевые слова'}), label='',
                              max_length=300,
                              required=False)
    organization = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Организация'}), label='',
                                   max_length=150, required=False)
    journal = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Журнал'}), label='', max_length=100,
                              required=False)


class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['content']
        labels = {
            'content': 'Комментарий'
        }

    def form_valid(self, form, post):
        form.instance.author = self.request.user
        form.instance.post = post
        return super().form_valid(form)

    def save(self, author, post):
        comment = super(CommentForm, self).save(commit=False)
        comment.author = author
        comment.post = post
        comment.save()
        return comment


class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ['title', 'content', 'date', 'journal', 'volume', 'number', 'file']
        labels = {
            'title': 'Название',
            'content': 'Описание',
            'date': 'Год публикации',
            'journal': 'Журнал',
            'volume': 'Том',
            'number': 'Номер',
            'file': 'Файл',
        }

    def save(self, author):
        post = super(PostForm, self).save(commit=False)
        post.author = author
        post.save()
        return post


class OrganizationForm(forms.ModelForm):
    class Meta:
        model = Organization
        fields = ['name', 'date', 'constitutors', 'address', 'link', 'description']
        labels = {
            'name': 'Название',
            'date': 'Дата создания',
            'constitutors': 'Учредители',
            'address': 'Адрес',
            'link': 'Ссылка',
            'description': 'Описание',
        }

    def save(self, **kwargs):
        organization = super(OrganizationForm, self).save(commit=False)
        organization.save()
        return organization
