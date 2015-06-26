//
//  main.m
//  Person
//
//  Kaira Villanueva


#import <Foundation/Foundation.h>

@interface Person: NSObject

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setCity:(NSString *)city;
- (NSString *)city;

- (void)setPhoneNumber:(NSString *)phoneNumber;
- (NSString *)phoneNumber;

- (BOOL)checkSameCity:(Person *)sameCity;

- (Person *)registerChild;

- (void)printThis;


@end

@implementation Person {
    NSString *_name;
    NSString *_phoneNumber;
    NSString *_city;
    BOOL *_sameCity;
    Person *_returnChild;
}

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

- (void)setCity:(NSString *)city {
    _city = city;
}

- (NSString *)city {
    return _city;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}

- (NSString *)phoneNumber {
    return _phoneNumber;
}


- (BOOL)checkSameCity:(Person *)otherPerson{
    
    NSString *myCity = [self city];
    
    NSString *theirCity = [otherPerson city];
    
    if(self->_city == otherPerson->_city){
        
    }
    
    
    if ([myCity isEqualToString: theirCity]){
        NSLog(@"corect!");
    } else {
        NSLog(@"not correct!");
    }
    return YES;
}

- (Person *)registerChild {
    Person* newBaby = [[Person alloc]init];
    
    [self setCityAndPhoneNumber:newBaby];
    
    return newBaby;
}

- (void)setCityAndPhoneNumber:(Person *)person {
    [person setPhoneNumber:_phoneNumber];
    [person setCity:_city];
    [person setName:@"Baby"];
}



- (void)printThis{
    NSLog(@"\nName: %@", _name);
    NSLog(@"\nPhone Number: %@", _phoneNumber);
    NSLog(@"\nLocation: %@", _city);
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *kaira = [[Person alloc]init];
        
        Person *melanie = [[Person alloc]init];
        
        [melanie setName:@"Melanie"];
        
        [melanie setPhoneNumber:@"201-844-5641"];
        
        [melanie setCity:@"Portland, Oregon"];
        
        [melanie printThis];
        
        [kaira setName:@"Kaira"];
        
        [kaira setPhoneNumber:@"201-844-0021"];
        
        [kaira setCity:@"Portland, Oregon"];
        
        [kaira checkSameCity:melanie];
        
        Person *myFirstKid = [kaira registerChild];
        
        [myFirstKid printThis];
        
        [kaira printThis];
        
    }
    return 0;
}
