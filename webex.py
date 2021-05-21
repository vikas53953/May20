import requests
import json

url = "https://webexapis.com/v1/messages"

payload = json.dumps({
  "roomId": "Y2lzY29zcGFyazovL3VzL1JPT00vMTU4YWRlOTAtYTQ1NS0xMWViLTk1ODUtZWRiOTJkMTg5YjFj",
  "markdown": "[Stève at Post/Con](https://www.getpostman.com/post-con-2019/)"
})
headers = {
  'Authorization': 'Bearer ZTE2NTI2ZTEtZWJhMy00M2RkLTkzNjAtZjYzZTI4ZmE5NTM5YTQyNWVmZTItZjc4_PF84_1eb65fdf-9643-417f-9974-ad72cae0e10f',
  'Content-Type': 'application/json'
}

response = requests.request("POST", url, headers=headers, data=payload)

#print(response.text)
