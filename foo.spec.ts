import { isStoreOwner } from './foo';

describe('Test optional chaining', () => {
  test(`should work`, () => {
    expect(isStoreOwner({
      name: 'James',
      isStoreOwner: false,
    })).toEqual(false);
  });
});
