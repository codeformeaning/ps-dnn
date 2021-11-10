#.1. Download taobao ad ctr dataset from https://tianchi.aliyun.com/dataset/dataDetail?dataId=56 to ./orig/

# 2. uncompress datasets
cd uncompress/
tar xvf ../orig/behavior_log.csv.tar.gz 
tar xvf ../orig/raw_sample.csv.tar.gz 
tar xvf ../orig/ad_feature.csv.tar.gz 
tar xvf ../orig/user_profile.csv.tar.gz
cd -

# 3.gen global user behavior feature from behavior_log.csv
# Note: This step needs main memorys more than 64GB, you can skip it.
echo "gen global user behavior feature from behavior_log.csv"
# python3 user_behavior_global.py

# 4.gen local user behavior feature from raw_sample.csv
echo "gen local user behavior feature from raw_sample.csv"
#python3 user_behavior_local.py

# 5.join ad features & user profile & global user feature & local user feature with raw_sample
echo "join ad features & user profile & global user feature & local user feature with raw_sample"
python3 gen_sample.py

# 6.shuffle train/test data
echo "shuffle train/test data"
shuf final_data/train_data -o final_data/train_data_shuf
shuf final_data/test_data -o final_data/test_data_shuf

