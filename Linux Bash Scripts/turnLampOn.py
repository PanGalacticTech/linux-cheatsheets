#turnLampOn.py


import requests




sad_lamp_on = "http://192.168.1.30/25/on"   # Get request to turn on SAD lamp
sad_lamp_off = "http://192.168.1.30/25/off"   # Get request to turn on SAD lamp

def change_sad_lamp():
    user_input = input("Type On or Off to control SAD Lamp?\n\n")
    print(user_input.lower())
    if user_input.lower() == "on":
        r = send_get(sad_lamp_on)
        print("Lamp On")
        print(r.status_code)
    elif user_input.lower() == "off":
        r = send_get(sad_lamp_off)
        print("Lamp Off")
        print(r.status_code)



def send_get(target):
    r = requests.get(target)  # r will contain the response object
    return r


def main():
    print("Hello")
    r = send_get(sad_lamp_on)
    #r = send_head(server_address)
    #r = send_post(server_address, "submit=On")
    print(r.status_code)  # print the response object 200 is successful
    print(r.headers)
#    print(r.headers["Content-Type"])
#    print(r.headers["Channel-Status"])
#    check_response(r.headers["Channel-Status"], "True" , "False" )

    #print(r.text)




if __name__ == '__main__':
    main()
