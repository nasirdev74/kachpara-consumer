
export enum FeedType {
    StoreAddition = "StoreAddition",
    ClaimFreeProduct = "ClaimFreeProduct",
    PlaceOrder = "PlaceOrder",
  }

export enum UserType {
    User = "User",
    SharedContact = "SharedContact",
    Referral = "Referral",
  }

export enum ActionType {
    ViewStoreDetails = "ViewStoreDetails",
    ViewRewardPage = "ViewRewardPage",
    AddStore = "AddStore",
    ViewOrderDetails = "ViewOrderDetails",
  }

export interface FeedItem {
    postedByStore: boolean;
    feedType: FeedType;
    userType: UserType;
    actionType: ActionType[];
    ownerId: string;
    audienceIds: string[];
    storeId: string;
    posterId: string;
    reciever: string;
    sender: string;
    orderId: string|null;
    content: string;
    contentUrl: string[];
    storeName: string;
    timeStamp: string;
  }
