FROM python:3.12-slim
RUN pip install flask
WORKDIR /myapp
COPY main.py /myapp/main.py
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 5000
CMD ["python", "/myapp/main.py"]


