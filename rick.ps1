import socket
import pyautogui
import io
from PIL import Image

server_ip = "192.168.1.100"  # <-- Твой IP
server_port = 9999

while True:
    # Сделать скриншот
    screenshot = pyautogui.screenshot()

    # Сжать в JPEG и отправить
    img_bytes = io.BytesIO()
    screenshot.save(img_bytes, format='JPEG', quality=50)
    data = img_bytes.getvalue()

    # Отправка по сети
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        try:
            s.connect((server_ip, server_port))
            s.sendall(len(data).to_bytes(4, 'big') + data)
        except:
            pass
