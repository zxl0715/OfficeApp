from django import forms


class SendEmail(forms.Form):
    subject = forms.CharField(label='subject', max_length=100)
    message = forms.CharField(widget=forms.Textarea)
    recipients = forms.EmailField(label='recipients', max_length=100)

    # cc_myself = forms.BooleanField(required=False)
