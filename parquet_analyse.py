import pandas as pd

# Path to your Parquet file
path_to_parquet = 'data/dev_data.parquet'

# Load the Parquet file
df = pd.read_parquet(path_to_parquet)

# Display the first few rows of the DataFrame to understand its structure

print(df.head())