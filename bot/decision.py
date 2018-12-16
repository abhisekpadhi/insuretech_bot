from bot.tree import Node
from bot.models import User, TreeNode
import json
from pprint import pprint
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
        if User.objects.get(email=kwargs.get('user_email')).status is None:
            ctx = self.build_ctx(
                title=kwargs.get('treenode_title'),
                node_id=kwargs.get('treenode_id')
            )

            User.objects.filter(email=kwargs.get('user_email')).update(
                status=json.dumps(ctx)
            )

            return True
        else:
            n = Node()
            User.objects.filter(email=kwargs.get('user_email')).update(
                status=json.dumps(
                    self.build_ctx(
                        title=kwargs.get('treenode_title'),
                        node_id=kwargs.get('treenode_id'),
                        subscribed=[] if not n.is_leaf(id=kwargs.get('treenode_id')) else str('plan_'+TreeNode.objects.get(id=kwargs.get('treenode_id')).ack_text).replace(' ','_') #Need to update this logic for multiple subscriptions
                    )
                )
            )
            return True

    # def get_plan_name(self, leaf_node_id):
    #     '''
    #     Given a leaf node, concatens the ack_text of path to create plan name
    #     :param leaf: node id
    #     :return: string
    #     '''
    #     treePath = [TreeNode.objects.get(id=leaf_node_id).ack_text]
    #     n = Node()
    #     leaf_node_id = n.get_parent(id=leaf_node_id)
    #     while True:
    #         parent_node = n.get_parent(id=leaf_node_id)
    #         if parent_node:
    #             treePath.append(TreeNode.objects.get(id=parent_node).ack_text)
    #             leaf_node_id = parent_node
    #         else:
    #             treePath.append(TreeNode.objects.get(id=parent_node).ack_text)
    #             break
    #     return '_'.join(treePath[::-1]).replace(' ', '_')

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