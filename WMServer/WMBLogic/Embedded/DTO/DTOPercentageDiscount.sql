select p.product_id,p.product_title,pd.percentage, pd.percentageDiscount_id
from PercentageDiscount pd
         join Products p on p.product_id = pd.product_id 