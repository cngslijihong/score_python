"""
Django settings for score project.

Generated by 'django-admin startproject' using Django 2.1.4.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '(d%s=d1qdg+9axhy32%uu3ecli*0he(jardrt%mp=uo60qg2j%'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'debug_toolbar',

    'xadmin',
    'crispy_forms',
    'reversion',
    'app_score'
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    #'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',

]

ROOT_URLCONF = 'score.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR,'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'score.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE':'django.db.backends.mysql',
        'NAME':'score2019',
        'USER':'root',
        'PASSWORD':'Notallowedtologin$10050611',
        'HOST':'192.168.1.4',
        'PORT':'3306',
    },
    'score2019': {
        'ENGINE':'django.db.backends.mysql',
        'NAME':'score2019',
        'USER':'root',
        'PASSWORD':'Notallowedtologin$10050611',
        'HOST':'192.168.1.4',
        'PORT':'3306',
    },
    'score2018': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'score2018',
        'USER': 'root',
        'PASSWORD': 'Notallowedtologin$10050611',
        'HOST': '192.168.1.4',
        'PORT': '3306',
    },
    'score2017': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'score2017',
        'USER': 'root',
        'PASSWORD': 'Notallowedtologin$10050611',
        'HOST': '192.168.1.4',
        'PORT': '3306',
    },

}


# Password validation
# https://docs.djangoproject.com/en/2.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/

#LANGUAGE_CODE = 'en-us'
LANGUAGE_CODE = 'zh-Hans'
TIME_ZONE = 'Asia/Shanghai'
USE_I18N = True
USE_L10N = True
USE_TZ = False
STATICFILES_DIRS = [
os.path.join(BASE_DIR,'static'),
]

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.1/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = '/var2/www/score/static/'
INTERNAL_IPS = ['127.0.0.1', ]
#DEBUG_TOOLBAR_CONFIG = { 'JQUERY_URL': 'https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js'}
#DEBUG_TOOLBAR_CONFIG = {'JQUERY_URL' : r"http://code.jquery.com/jquery-2.1.1.min.js"}
DEBUG_TOOLBAR_CONFIG = {"JQUERY_URL": '',}

DEBUG_TOOLBAR_PANELS = [
    'debug_toolbar.panels.versions.VersionsPanel',
    'debug_toolbar.panels.timer.TimerPanel',
    'debug_toolbar.panels.settings.SettingsPanel',
    'debug_toolbar.panels.headers.HeadersPanel',
    'debug_toolbar.panels.request.RequestPanel',
    'debug_toolbar.panels.sql.SQLPanel',
    'debug_toolbar.panels.staticfiles.StaticFilesPanel',
    'debug_toolbar.panels.templates.TemplatesPanel',
    'debug_toolbar.panels.cache.CachePanel',
    'debug_toolbar.panels.signals.SignalsPanel',
    'debug_toolbar.panels.logging.LoggingPanel',
    'debug_toolbar.panels.redirects.RedirectsPanel',
]

CACHES = {
    'default': {
        'BACKEND': 'django.core.cache.backends.db.DatabaseCache',
        'LOCATION': 'my_cache_table',  # 要缓存的表名
        'TIMEOUT': 600,                # 默认的缓存有效时间,以秒计. 默认值是 300 秒(五分钟).
        'OPTIONS': {
            'MAX_ENTRIES': 1000        # 缓存的最大条目数(超出该数旧的缓存会被清除,默认值是 300).
        }
    }
}


MIDDLEWARE_CLASSES = (
    'django.middleware.cache.UpdateCacheMiddleware',          # 注意位置，在前
    'django.middleware.common.CommonMiddleware',
    'django.middleware.cache.FetchFromCacheMiddleware',       # 注意位置，在后
    'django.middleware.cache.CacheMiddleware',
)

CACHE_MIDDLEWARE_SECONDS = 500   # 每个页面应该被缓存的秒数
