import smtplib
from email.header import Header
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

# 发送邮件
# subject：主题
# message：消息
# recipients：收件人
# sender：发送人
# senderPwd：发送人密码
# host：SMTP服务器地址
# port：SMTP服务器端口号
import os


def send_mail(subject, message, recipients, sender, senderPwd, host, port):
    msg = MIMEText(message, 'html', 'utf-8')  # 邮件内容
    msg['Subject'] = Header(subject, 'utf-8').encode()  # 邮件主题
    msg['From'] = sender  # Header(sender, 'utf-8').encode()
    msg['To'] = recipients  # Header(recipients, 'utf-8').encode()
    smtp = smtplib.SMTP(host, port=port)
    smtp.login(sender, senderPwd)
    smtp.sendmail(sender, [recipients], msg.as_string())
    smtp.quit()
    return True


# 发送邮件
# subject：主题
# message：消息
# recipients：收件人
# sender：发送人
# senderPwd：发送人密码
# host：SMTP服务器地址
# port：SMTP服务器端口号
def send_mail(subject, message, att, recipients, sender, senderPwd, host, port):
    # 创建一个带附件的实例
    msg = MIMEMultipart()

    # msg = MIMEText(message, 'html', 'utf-8')  # 邮件内容
    puretext = MIMEText(message, 'html', 'utf-8')  # 邮件内容
    msg.attach(puretext)

    for file in att:
        # jpg类型的附件
        jpgpart = MIMEApplication(open(os.path.join("upload", file), 'rb').read())
        jpgpart.add_header('Content-Disposition', 'attachment', filename=file)
        msg.attach(jpgpart)
    # att1 = MIMEText(open(os.path.join("upload", att), "rb").read(), 'base64', 'gb2312')
    #     att1["Content-Type"] = 'application/octet-stream'
    #     att1["Content-Disposition"] = 'attachment; filename="123.doc"'  # 这里的filename可以任意写，写什么名字，邮件中显示什么名字
    #     msg.attach()
    msg['Subject'] = Header(subject, 'utf-8').encode()  # 邮件主题
    msg['From'] = sender  # Header(sender, 'utf-8').encode()
    msg['To'] = recipients  # Header(recipients, 'utf-8').encode()
    try:
        smtp = smtplib.SMTP(host, port=port)
        smtp.login(sender, senderPwd)
        smtp.sendmail(sender, [recipients], msg.as_string())
        smtp.quit()
        smtp.close()
    except smtplib.SMTPRecipientsRefused:
        print('Recipient refused')
    except smtplib.SMTPAuthenticationError:
        print('Auth error')
    except smtplib.SMTPSenderRefused:
        print('Sender refused')
    except smtplib.SMTPException as e:
        print(e.message)
    return True
