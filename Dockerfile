FROM python:3

WORKDIR /usr/src/app

COPY . .

RUN python3 setup.py install

CMD [ "python3", "./examples/v2/dojo_ci_cd.py" ]

python3 dojo_ci_cd.py --product=1 --file "/tests/scans/Bodgeit-burp.xml" --scanner="Burp Scan" --high=0 --host=http://localhost:8000 --api_key=<api_key> --user=admin
