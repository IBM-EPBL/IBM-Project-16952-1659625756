import psycopg2
class DbModel:
    def __init__(self):
        self.conn=psycopg2.connect(
            host="localhost",
            database="expense_tracker",
            user="aggron",
            password="mvemjsun8"
        )

    def register(self,email,pwd):
        cursor=self.conn.cursor()
        try:
            cursor.execute("INSERT INTO auth VALUES(%s, %s)", (email,pwd))
            self.conn.commit()
        except:
            return False
        return True

    def login(self,email,pwd):
        cursor=self.conn.cursor()
        cursor.execute("SELECT * FROM auth where email=%s and password=%s", (email,pwd))
        data=cursor.fetchone()
        if data:
            return True
        else:
            return False
    def change(self,oldemail,oldpwd,newemail,newpwd):
        cursor=self.conn.cursor()
        try:
            cursor.execute("UPDATE auth SET email= %s , password= %s WHERE email= %s AND password= %s",(newemail,newpwd,oldemail,oldpwd))
            self.conn.commit()
        except(Exception, psycopg2.DatabaseError) as error:
            print(error)
            return False
        return True
    def delete(self,email,pwd):
        cursor=self.conn.cursor()
        try:
            cursor.execute("DELETE FROM auth where email=%s and password=%s",(email,pwd))
            self.conn.commit()
        except:
            return False
        return True
    def __del__(self):
        self.conn.close()
