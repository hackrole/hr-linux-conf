import pexpect
import pyotp
import signal
import struct
import sys
import fcntl
import termios

totp = pyotp.TOTP("<qr-code>")
c = pexpect.spawn("ssh jump")
print(totp.now())


def get_terminal_size():
    s = struct.pack('HHHH', 0, 0, 0, 0)
    a = struct.unpack('hhhh',
                      fcntl.ioctl(sys.stdout.fileno(), termios.TIOCGWINSZ, s))
    return a[0], a[1]


def sig_win(sig, data):
    global c
    c.setwinsize(*get_terminal_size())


signal.signal(signal.SIGWINCH, sig_win)
c.expect("password:")
c.sendline("<password>")
c.expect("MFA auth")
c.sendline(totp.now())
c.expect("Opt>")
c.sendline("p")
c.setwinsize(*get_terminal_size())
c.interact()
