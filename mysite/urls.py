from django.contrib import admin
from django.contrib.auth import views as auth_views
from django.urls import include, path
from users import views as user_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('blog.urls')),
    path('sign_up/', user_views.sign_up, name='sign_up'),
    path('login/', user_views.NewLoginView.as_view(template_name='users/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(template_name='users/logout.html'), name='logout'),
    path('user/<int:pk>/update', user_views.user_update_profile, name='user-detail-update'),
    path('user/<int:pk>/delete/', user_views.UserDeleteView.as_view(), name='user-delete'),
    path('user/<int:pk>/', user_views.user_detail, name='user-detail'),
    path('user/<int:pk>/grant_add/', user_views.grant_add, name='grant_add'),
    path('admin_panel/', user_views.admin_panel, name='admin-panel'),
    path('organization-autocomplete', user_views.OrganizationAutocomplete.as_view(), name='organization-autocomplete'),
    path('organization/<int:pk>', user_views.organization_detail, name='organization-detail'),
    path('organization/new', user_views.organization_create, name='organization-create'),
    path('tinymce/', include('tinymce.urls')),
]

from django.conf import settings
from django.conf.urls.static import static

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
