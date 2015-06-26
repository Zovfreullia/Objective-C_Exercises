//
//  main.m
//  CaesarCipher
//  Kaira Villanueva

#import <Foundation/Foundation.h>

@interface CaesarCipher : NSObject

- (NSString *)decode:(NSString *)string offset:(int)offset;
- (NSString *)encode:(NSString *)string offset:(int)offset;
- (BOOL)codeBreaker:(NSString *)codeOne
                   :(NSString *)codeTwo;


- (void)printThis;

@end

@implementation CaesarCipher{

}


- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [string getCharacters:buffer range:NSMakeRange(0, count)];

    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }

        int low = islower(buffer[i]) ? 'a' : 'A';
        result[i] = (buffer[i]%low + offset)%26 + low;
    }

    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}






- (BOOL)codeBreaker:(NSString *)codeOne
                   :(NSString *)codeTwo{
    [self decode: codeOne offset: 5];
    [self decode: codeTwo offset: 7];
    
    NSString *one = [self decode: codeOne offset: 5];
    NSString *two = [self decode: codeTwo offset: 7];
    
    return([one isEqualToString: two]);

}



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        CaesarCipher *code = [[CaesarCipher alloc]init];
        
//        [code decode:@"Hey" int:10]
        [code codeBreaker:@"HI:"
                         :@"Heyll"];

        
        NSString *code1 = [code encode:@"Hello" offset:5];
        NSString *code2 = [code encode:@"Hello" offset:7];
        
        [code codeBreaker:code1
                         :code2];
        
        NSLog(@"%d", [code codeBreaker:code1 :code2]);
        
        
        return 0;
    }
    
}
