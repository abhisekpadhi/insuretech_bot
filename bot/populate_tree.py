# 2from bot.tree import Node

n = Node()
n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select category", is_root=True)
# n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select category")
 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select brand", ack_text="wearables", parent_node=1)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select brand", ack_text="tablets", parent_node=1)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select brand", ack_text="phones", parent_node=1)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select brand", ack_text="action cameras", parent_node=1)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select brand", ack_text="laptops", parent_node=1)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select brand", ack_text="photography gear", parent_node=1)
 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select model", ack_text="sennheiser", parent_node=3)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select model", ack_text="akg", parent_node=3)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select model", ack_text="shure", parent_node=3)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select model", ack_text="bose", parent_node=3)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select model", ack_text="audio technica", parent_node=3)

 n.update_or_create(title="appliance", action_template="single_choice", prompt_text="select model", ack_text="grado", parent_node=3)

 n.update_or_create(title="appliance", action_template="single_choice", is_leaf=True, ack_text="hd 310", parent_node=11)

 n.update_or_create(title="appliance", action_template="single_choice", is_leaf=True, ack_text="hd 800", parent_node=11)

 n.update_or_create(title="appliance", action_template="single_choice", is_leaf=True, ack_text="akg-1", parent_node=12)

 n.update_or_create(title="appliance", action_template="single_choice", is_leaf=True, ack_text="akg-2", parent_node=12)

 n.update_or_create(title="appliance", action_template="single_choice", is_leaf=True, ack_text="shure s130", parent_node=13)

 n.update_or_create(title="appliance", action_template="single_choice", is_leaf=True, ack_text="qb210", parent_node=14)

 n.update_or_create(title="appliance", action_template="single_choice", is_leaf=True, ack_text="at123", parent_node=15)

 n.update_or_create(title="appliance", action_template="single_choice", is_leaf=True, ack_text="g123", parent_node=16)

