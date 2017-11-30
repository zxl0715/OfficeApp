import smtplib
from email.header import Header
from email.mime.text import MIMEText


# 发送邮件
# subject：主题
# message：消息
# recipients：收件人
# sender：发送人
# senderPwd：发送人密码
# host：SMTP服务器地址
# port：SMTP服务器端口号
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
