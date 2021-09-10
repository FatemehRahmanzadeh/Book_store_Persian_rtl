import uuid
from jalali_date import date2jalali, datetime2jalali


def get_random_code():
    code = str(uuid.uuid4())[:8].replace('-', '').lower()
    return code


def get_jalali_date(date):
    return datetime2jalali(date)
