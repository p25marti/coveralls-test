interface User {
  name: string;
  isStoreOwner: boolean;
}

export const isStoreOwner = (user: User) => user?.isStoreOwner;

export const getName = (user: User) => user.name;
