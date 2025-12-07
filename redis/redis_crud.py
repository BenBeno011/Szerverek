import redis

# Kapcsolodas a helyi Redis szerverhez
r = redis.Redis(host='localhost', port=6379, db=0)

def add_user():
    user_id = input("User ID: ")
    name = input("Name: ")
    email = input("Email: ")

    r.hset(f"user:{user_id}", mapping={
        "name": name,
        "email": email
    })
    print("User added.")

def get_user():
    user_id = input("User ID: ")
    data = r.hgetall(f"user:{user_id}")
    if data:
        print({k.decode(): v.decode() for k, v in data.items()})
    else:
        print("User not found.")

def delete_user():
    user_id = input("User ID: ")
    r.delete(f"user:{user_id}")
    print("User deleted.")

def main():
    while True:
        print("\n--- REDIS CRUD MENU ---")
        print("1) Add user")
        print("2) Get user")
        print("3) Delete user")
        print("4) Exit")

        choice = input("Choose: ")

        if choice == "1": add_user()
        elif choice == "2": get_user()
        elif choice == "3": delete_user()
        elif choice == "4": break
        else: print("Invalid choice")


if __name__ == "__main__":
    main()
