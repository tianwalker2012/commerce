UCenter���ϴ�ͷ���ܵİ���
http://blog.csdn.net/maquan
2010-10-15

���ĵ����ݽ�����������ѧϰ֮�ã���صĴ��벢δ����ʵ��Ӧ��ϵͳ����������û������֤�ȹ��ܣ�ͬʱ���� UCenter ������ɵ����ƣ����𽫱��ĸ����Ĵ���ֱ������ʵ�ʵĲ�Ʒ����Ŀ�С�

Discuz! �� UCHome �е�ͷ���ϴ����ܺܺ��ã�����в����˺���һ����Ū���������ôʵ�ֵģ�����ϣ����ֲ���Լ���Ӧ��ϵͳ�С�

���������ʵ���� UCenter ��ʵ�ֵģ����� Discuz! �� UCHome ��������ز�Ʒ�������Ĺ���ģ�飩��ͨ��һ�� Flash �ļ���camera.swf����������˵� PHP ���������ɵġ�

UCenter/UCHome �����ǿ�Դ�ģ����Ǹ� camera.swf ��û���ṩԴ���롣���ǿ���ͨ���� PHP ������з����о���������������������ܲ�����ϸ�ڣ������ս����������������� UCenter ���������С������������ݵ��� UCenter1.5.0/UCHome2.0 ��

������������һ�� UCenter/UCHome �������������ô�����ġ�

�� ��������

0. ��������� UCHome �е�һ�� web ҳ�棬���а��� camera.swf��Ϊ��֤ camera.swf ������������������ͬ��·������Ҫ�� locale.xml �ļ���

    װ�� camera.swf �� HTML �������������ĳ������ɣ�

        home\uc_client\client.php : uc_avatar()

    ���ɵ����ݴ������£�

        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="447" height="477" id="mycamera" align="middle">
            <param name="allowScriptAccess" value="always" />
            <param name="scale" value="exactfit" />
            <param name="wmode" value="transparent" />
            <param name="quality" value="high" />
            <param name="bgcolor" value="#ffffff" />
            <param name="movie" value="http://localhost/center/images/camera.swf?inajax=1&appid=1&input=6b49vKhr%2FC4VpMIMCAt07Kr2eQk8jjY%2F6vtvDonod47dU7JK%2BxVFJPIVY%2FJGMQoSpzHylapBa8FbsEWFGorPwZDJRM10wGjxvbHKTVmVgrng%2BpoSTTsk%2BE3U&agent=a523e70c80e13e4eaee37c7f4bde4f2c&ucapi=http%3A%2F%2Flocalhost%2Fcenter&avatartype=virtual" />
            <param name="menu" value="false" />
            <embed src="http://localhost/center/images/camera.swf?inajax=1&appid=1&input=6b49vKhr%2FC4VpMIMCAt07Kr2eQk8jjY%2F6vtvDonod47dU7JK%2BxVFJPIVY%2FJGMQoSpzHylapBa8FbsEWFGorPwZDJRM10wGjxvbHKTVmVgrng%2BpoSTTsk%2BE3U&agent=a523e70c80e13e4eaee37c7f4bde4f2c&ucapi=http%3A%2F%2Flocalhost%2Fcenter&avatartype=virtual"
                quality="high"
                bgcolor="#ffffff"
                width="447"
                height="477"
                name="mycamera"
                align="middle"
                allowScriptAccess="always"
                allowFullScreen="false"
                scale="exactfit"
                wmode="transparent"
                type="application/x-shockwave-flash"
                pluginspage="http://www.macromedia.com/go/getflashplayer" />
        </object>

    �����ֽ����£�

        inajax      1
        appid       1
        input       6b49vKhr%2FC4VpMIMCAt07Kr2eQk8jjY%2F6vtvDonod47dU7JK%2BxVFJPIVY%2FJGMQoSpzHylapBa8FbsEWFGorPwZDJRM10wGjxvbHKTVmVgrng%2BpoSTTsk%2BE3U
        agent       a523e70c80e13e4eaee37c7f4bde4f2c
        ucapi       http://localhost/center
        avatartype  virtual

    ���еĹؼ�����Ϊ ucapi���������� POST �� URL Ϊ <ucapi>/index.php

    ����� "/index.php" �ƺ��� hardcode �� camera.swf ��ģ����������ĳ�������лῴ�����������ָ���� ucapi ��ȷ������һ�� php �ļ��Ļ��������ƿ� index.php ����ļ��������仰˵���������˲��ǲ��� PHP����������һ�ֱ�����ԵĻ������� Java/.NET �ȣ���Ҳ�ǿ���ʵ�ֵġ�

1. �û��� camera.swf �С�ѡ��ͼƬ����camera.swf �����̰�ѡ�е�ͼƬ�ϴ�����������

    $_SERVER

        REQUEST_URI /center/index.php?m=user&inajax=1&a=uploadavatar&appid=1&input=ca68o1L41a1HkbmhMJVGHu0oFjxYXwadnUT9HnFpnyz5AgiZcsVGecPP38w%2BwM7XtT79zC5WMWlH8T7LvluCSXS3YUsrcJDoD1ySILNO2xo63hmBAvXVX24f&agent=a523e70c80e13e4eaee37c7f4bde4f2c&avatartype=virtual
        METHOD      POST

    $_GET

        m           user
        inajax      1
        a           uploadavatar
        appid       1
        input       ca68o1L41a1HkbmhMJVGHu0oFjxYXwadnUT9HnFpnyz5AgiZcsVGecPP38w+wM7XtT79zC5WMWlH8T7LvluCSXS3YUsrcJDoD1ySILNO2xo63hmBAvXVX24f
        agent       a523e70c80e13e4eaee37c7f4bde4f2c
        avatartype  virtual

    $_POST

        Filename    something.jpg
        Upload      Submit Query

    $_FILES

        ͼƬ�ļ�����

    �������Ϊ��

        center\control\user.php : onuploadavatar()

    ���򷵻ص�����Ϊ������ļ�����ʱλ�ã����磺

        http://localhost/center/data/tmp/upload5.jpg

    camera.swf ��ͨ�����������ַ����ȡͼƬ����ʾ�������������������·���ֵ��Ϊ������룺

        -1 : Invalid identity!
        -2 : Invalid photograph!
        -3 : No photograph be upload!
        -4 : Can not write to the data/tmp folder!
        -5 : Server can not upload!

2. �û��� camera.swf �С�ȷ������camera.swf ����������ϴ� 3 ��ͼƬ���ݣ���Ϊ���С�С�ߴ��ͷ��ͼƬ��

    $_SERVER

        REQUEST_URI /center/index.php?m=user&inajax=1&a=rectavatar&appid=1&input=ca68o1L41a1HkbmhMJVGHu0oFjxYXwadnUT9HnFpnyz5AgiZcsVGecPP38w%2BwM7XtT79zC5WMWlH8T7LvluCSXS3YUsrcJDoD1ySILNO2xo63hmBAvXVX24f&agent=a523e70c80e13e4eaee37c7f4bde4f2c&avatartype=virtual&randomnumber=5478
        METHOD      POST

    $_GET

        m               user
        inajax          1
        a               rectavatar
        appid           1
        input           ca68o1L41a1HkbmhMJVGHu0oFjxYXwadnUT9HnFpnyz5AgiZcsVGecPP38w+wM7XtT79zC5WMWlH8T7LvluCSXS3YUsrcJDoD1ySILNO2xo63hmBAvXVX24f
        agent           a523e70c80e13e4eaee37c7f4bde4f2c
        avatartype      virtual
        randomnumber    5478

    $_POST

        avatar1     ...<big>
        avatar3     ...<middle>
        avatar2     ...<small>

    �������Ϊ��

        center\control\user.php : onrectavatar()

    ����ķ�������Ϊ��

        �ɹ�ʱ: <?xml version="1.0" ?><root><face success="1"/></root>

        ʧ��ʱ: <root><message type="error" value="-1" /></root>

3. �ϴ���ɺ���� camera.swf ���ҵ���Ϊ updateavatar() �� Javascript function���ͻ��������


�� ��������

������� 0 �����ɵ� HTML �У�ָ�� camera.swf �� URL Я����һЩ������������ؼ����� ucapi���������˵� 1 ���͵� 2 ���� HTTP Request �������

������������ UCenter Ӧ��ϵͳ����Ҫ�Ĳ�����camera.swf ��רΪ UCenter ��Ƶģ��������ر�֧���⼸������ֵ��Ҳ����˵���ڷ��� camera.swf �� URL �������ʲôֵ���ں������� ucapi ��ʱ��ͻ�ԭ����������

camera.swf û���ṩԴ���룬û�취���죬��������������ʹ���������磬���ǿ��Խ��� input ������������Լ�Ӧ�ó�������Ҫ���Զ������������ user id��ͳһ����װ�����ֵ�


�� ����ʵ��

������˹��ܲ�����ϸ�ںͲ������壬����ʵ��������ܾͺ������ˡ�

��ν���°���ʵ�֣�������ֱ�ӽ��� camera.swf/locale.xml �������ļ���ǰ���£����±�д�������˵Ĵ������ʵ��ͷ���ϴ����ܣ����� UCenter �������С�

�������κη���˱�����Զ����ԣ�������ֻ���� PHP �Ĵ��롣

���������������ļ���

    avatar.php  -- ʵ�������桰�������衱���ᵽ��ȫ������
    camera.swf  -- ��ȡ�� UCenter
    locale.xml  -- ��ȡ�� UCenter

���������ļ����� web server �ϣ�Ȼ����� http://localhost/avatar.php ���ɡ��������� URL ��ָ��һ�� uid ��Ϊ���û���ʶ�������� http://localhost/avatar.php?uid=5

�������ص�ַ: http://maquan.download.csdn.net/
