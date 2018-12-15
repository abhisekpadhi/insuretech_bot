from bot.tree import Node
from bot.models import User, TreeNode
import json

class Decider:
    '''
    Decision context is stored in `status` field of User table.
    '''
    def is_new_customer(self, **kwargs):
        if User.objects.get(id=kwargs.get('id')).status is None:
            return True
        else:
            return False

    def build_ctx(self, **kwargs):
        '''
        Builds context dict
        :param kwargs:
        :return:
        '''
        ctx = {
            "funnel": {
                "title": kwargs.get('title'),
                "node_id": kwargs.get('node_id')
            },
            "subscribed": kwargs.get('subscribed', [])
        }
        return ctx

    def update_or_create(self, **kwargs):
        '''
        Create decision context of a user
        :param kwargs:
        :return:
        '''
        if User.objects.get(id=kwargs.get('id')).status is None:
            ctx = self.build_ctx(
                title=kwargs.get('title'),
                node_id=kwargs.get('node_id')
            )
            User.objects.update_or_create(
                id=kwargs.get('id'),
                status=ctx
            )
            return True
        else:
            return False

    def read(self, **kwargs):
        '''
        Retrieves decision context of a user
        :param kwargs:
        :return:
        '''
        if User.objects.get(id=kwargs.get('id')).status is not None:
            return json.loads(User.objects.get(id=kwargs.get('id')).status)
        else:
            return None

    def delete(selfs, **kwargs):
        '''
        Deletes decision context of a user
        :param kwargs:
        :return:
        '''
        # TODO: Implement
        pass