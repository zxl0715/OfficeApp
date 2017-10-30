import smtplib
from email.header import Header
from email.mime.text import MIMEText


def send_mail(subject, message, sender, recipients):
    username = sender
    password = '6402##zxlZXL'

    mail_host = 'smtp.163.com'
    port = 25

    msg = MIMEText(message, 'html', 'utf-8')  # 邮件内容
    msg['Subject'] = Header(subject, 'utf-8').encode()  # 邮件主题
    msg['From'] = username  # Header(sender, 'utf-8').encode()
    msg['To'] = recipients  # Header(recipients, 'utf-8').encode()
    smtp = smtplib.SMTP(mail_host, port=port)
    smtp.login(username, password)
    smtp.sendmail(username, [recipients], msg.as_string())
    smtp.quit()
    return True
