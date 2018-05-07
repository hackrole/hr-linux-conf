get_ipython().define_macro('tcli', """
from wechatpy import WeChatClient
TEST_ID = 'wx30410a5e072a2169'
TEST_SECRET = '27c461770e333569cba93628173af43e'
test_cli = WeChatClient(TEST_ID, TEST_SECRET)
                           """)

get_ipython().define_macro('mcli', """
from wechatpy import WeChatClient
MODA_ID = 'wx4002be6f5b7b5acf'
MODA_SECRET = '9e32de4908f55fde18023f7870dad74f'
moda_cli = WeChatClient(MODA_ID, MODA_SECRET)
                           """)

get_ipython().define_macro('ycli', """
from wechatpy import WeChatClient
YM_ID = 'wx6ade6ec78f29f559'
YM_SECRET = 'fe2e7853da62f00a5a03e051c7108986'
ym_cli = WeChatClient(YM_ID, YM_SECRET)
                           """)
