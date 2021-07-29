import pandas as pd
import xgboost as xgb
import json
from time import time

s = time()
x = pd.read_parquet('/opt/data/group_X_train.pq')
y = pd.read_parquet('/opt/data/group_y_train.pq')

model = xgb.XGBRegressor(**json.load(open("/opt/data/params.json", "rt")))


model.fit(x, y)

model.predict(x)

print(f"Execution seconds: {int(time() - s)}")
