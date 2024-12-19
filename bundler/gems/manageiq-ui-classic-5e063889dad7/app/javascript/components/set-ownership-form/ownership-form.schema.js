import { componentTypes } from '@@ddf';

const createSchema = (ownerOptions, groupOptions) => ({
  fields: [{
    component: componentTypes.SELECT,
    name: 'user',
    id: 'user_name',
    label: __('Select an Owner:'),
    options: ownerOptions,
  }, {
    component: componentTypes.SELECT,
    name: 'group',
    id: 'group_name',
    label: __('Select a Group:'),
    options: groupOptions,
  }],
});

export default createSchema;
