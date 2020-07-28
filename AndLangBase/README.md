# AndLangBase
Android快速开发——基础库+开发框架

## 基础课引入

项目根目录的gradle引入butterknife库

classpath 'com.jakewharton:butterknife-gradle-plugin:8.4.0'

app.gradle引入基础库

implementation project(':andlang')

AndroidManifest.xml中配置主题样式

android:theme="@style/AppTheme.LangNoActionBar"

## 推送lib引入

项目根目录的gradle
	
	//个推
	maven {
            url "http://mvn.gt.igexin.com/nexus/content/repositories/releases/"
        }
        
	//华为系统推送
        maven {
            url 'http://developer.huawei.com/repo/'
        }

        //魅族系统推送
        maven{
            url 'https://oss.jfrog.org/artifactory/oss-snapshot-local'
        }

app.gradle引入推送lib库

implementation project(':langpush')
