from faker import Faker
import mysql.connector
import os

# Initialize Faker
fake = Faker()

# Database configuration
db_config = {
    "host": os.getenv("MYSQL_HOST", "mysql-db"),
    "user": os.getenv("MYSQL_USER", "irs_user"),
    "password": os.getenv("MYSQL_PASSWORD", "password123"),
    "database": os.getenv("MYSQL_DATABASE", "irs_data")
}

def generate_fake_data(num_taxpayers=100, num_returns=300):
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    # Generate fake taxpayers
    for _ in range(num_taxpayers):
        name = fake.name()
        age = fake.random_int(min=18, max=90)
        state = fake.state()
        cursor.execute("INSERT INTO taxpayers (name, age, state) VALUES (%s, %s, %s)", (name, age, state))

    # Generate fake returns
    for _ in range(num_returns):
        taxpayer_id = fake.random_int(min=1, max=num_taxpayers)  # Assuming taxpayer IDs are sequential
        year = fake.random_int(min=2010, max=2023)
        tax_paid = fake.random_int(min=1000, max=100000)
        refund = fake.random_int(min=0, max=tax_paid // 10)  # Refund is at most 10% of tax paid
        filing_type = fake.random_element(elements=('individual', 'corporate'))
        cursor.execute("INSERT INTO returns (taxpayer_id, year, tax_paid, refund, filing_type) VALUES (%s, %s, %s, %s, %s)", 
                       (taxpayer_id, year, tax_paid, refund, filing_type))

    conn.commit()
    cursor.close()
    conn.close()

if __name__ == "__main__":
    generate_fake_data() 