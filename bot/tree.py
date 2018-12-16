from bot.models import TreeNode
from django.forms import model_to_dict

class Node:
    def update_or_create(self, **kwargs):
        '''
        Creates a node
        :return:
        '''
        if 'title' not in kwargs.keys() or kwargs['title'] is None:
            return False

        TreeNode.objects.update_or_create(
            title=kwargs.get('title'),
            ack_text=kwargs.get('ack_text'),
            action_template=kwargs.get('action_template'),
            is_leaf=kwargs.get('is_leaf', False),
            priority=kwargs.get('priority'),
            prompt_text=kwargs.get('prompt_text'),
            parent_node=kwargs.get('parent_node'),
            is_root=kwargs.get('is_root', False)
        )

        return True

    def read(self, **kwargs):
        '''
        Read a node
        :return: list
        '''
        if 'is_root' in kwargs.keys():
            queryset = TreeNode.objects.filter(
                is_root=True
            )
        else:
            queryset = TreeNode.objects.filter(
                id=kwargs.get('id')
            )
        return [model_to_dict(node) for node in queryset]

    def traverse(self, **kwargs):
        '''
        Traverse down the tree
        :param kwargs:
        :return:
        '''
        queryset = TreeNode.objects.filter(
            parent_node=kwargs.get('id')
        )
        return [model_to_dict(node) for node in queryset]

    def is_leaf(self, **kwargs):
        '''
        Determines if a node is leaf
        :return: boolean
        '''
        return TreeNode.objects.get(
            id=kwargs.get('id')
        ).is_leaf

    def get_parent(self, **kwargs):
        '''
        Determines the parent of a given node
        :param kwargs: node id
        :return: int
        '''
        if TreeNode.objects.get(
                id=kwargs.get('id')
        ).is_root:
            return False
        return TreeNode.objects.get(
            id=kwargs.get('id')
        ).parent_node

    def delete(self, **kwargs):
        '''
        Delete a node
        :return:
        '''
        TreeNode.objects.filter(id=kwargs.get('id')).delete()