import pandas as pd
import csv
from sqlalchemy import create_engine


res_file_path = "./data/jobs_data.csv"
col_data = dict()
job_id_ls = []
new_col = dict()


# file concat
def file_concat():
    f1 = pd.read_csv("./data/ai_job_dataset1.csv")
    f2 = pd.read_csv("./data/ai_job_dataset2.csv")
    f = pd.concat([f1, f2], ignore_index=True)
    for col in f.columns[:5]:
        col_data[col] = f[col]
    col_data_df = pd.DataFrame(col_data)
    col_data_df.to_csv(res_file_path, index=False)


# for inserting job_id column
def new_col():
    f = pd.read_csv("./data/jobs_data.csv")
    for idx, row in f.iterrows():
        job_id_ls.append(f"AI0{idx + 1}")
    new_col["job_id"] = job_id_ls
    new_col_df = pd.DataFrame(new_col)
    final_df = pd.concat([new_col_df, f], axis=1)
    final_df.to_csv(res_file_path, index=False)


# for refining data quality
def d_quality():
    f = pd.read_csv("./data/jobs_data.csv")
    # f["required_skills"] = f["required_skills"].apply(lambda x: ', '.join(x) if isinstance(x, list) else x)
    # f["required_skills"] = f["required_skills"].str.replace(',', '|')
    print(f["required_skills"].head(10))
    # f.to_csv(res_file_path, index=False, quoting=csv.QUOTE_MINIMAL)
