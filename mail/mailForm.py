from django import forms


class SendEmail(forms.Form):
    subject = forms.CharField(label="subject", max_length=1000)
    message = forms.CharField(widget=forms.Textarea)
    sender = forms.EmailField()
    # cc_myself = forms.BooleanField(required=False)
