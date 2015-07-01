/**
 迭代器模式总结
 迭代器模式是一种使用频率非常高的设计模式，通过引入迭代器可以将数据的遍历功能从聚合对象中分离出来，聚合对象只负责存储数据，而遍历数据由迭代器来完成。由于很多编程语言的类库都已经实现了迭代器模式，因此在实际开发中，我们只需要直接使用Java、C#、OC等语言已定义好的迭代器即可，迭代器已经成为我们操作聚合对象的基本工具之一。
 
 1. 主要优点
 迭代器模式的主要优点如下： 
 (1) 它支持以不同的方式遍历一个聚合对象，在同一个聚合对象上可以定义多种遍历方式。在迭代器模式中只需要用一个不同的迭代器来替换原有迭代器即可改变遍历算法，我们也可以自己定义迭代器的子类以支持新的遍历方式。
 (2) 迭代器简化了聚合类。由于引入了迭代器，在原有的聚合对象中不需要再自行提供数据遍历等方法，这样可以简化聚合类的设计。
 (3) 在迭代器模式中，由于引入了抽象层，增加新的聚合类和迭代器类都很方便，无须修改原有代码，满足“开闭原则”的要求。
 
 2. 主要缺点
 迭代器模式的主要缺点如下：
 (1) 由于迭代器模式将存储数据和遍历数据的职责分离，增加新的聚合类需要对应增加新的迭代器类，类的个数成对增加，这在一定程度上增加了系统的复杂性。
 (2) 抽象迭代器的设计难度较大，需要充分考虑到系统将来的扩展，例如JDK内置迭代器Iterator就无法实现逆向遍历，如果需要实现逆向遍历，只能通过其子类ListIterator等来实现，而ListIterator迭代器无法用于操作Set类型的聚合对象。在自定义迭代器时，创建一个考虑全面的抽象迭代器并不是件很容易的事情。
 
 3. 适用场景
 在以下情况下可以考虑使用迭代器模式：
 (1) 访问一个聚合对象的内容而无须暴露它的内部表示。将聚合对象的访问与内部数据的存储分离，使得访问聚合对象时无须了解其内部实现细节。
 (2) 需要为一个聚合对象提供多种遍历方式。
 (3) 为遍历不同的聚合结构提供一个统一的接口，在该接口的实现类中为不同的聚合结构提供不同的遍历方式，而客户端可以一致性地操作该接口。
 */
#import <Foundation/Foundation.h>
#import "ConcreteIterator.h"
#import "ConcreteIteratorDesc.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr = @[@1, @2, @3, @4];
        
        NSLog(@"=========== 我的迭代器 ===========");
        Iterator<Iterator> *iterator = [[ConcreteIterator alloc] initWithArray:arr];
        id theObj = nil;
        while (theObj = [iterator nextObject]) {
            NSLog(@"%@", theObj);
        }
        
        NSLog(@"=========== 我的逆序迭代器 ===========");
        Iterator<Iterator> *iteratorDesc = [[ConcreteIteratorDesc alloc] initWithArray:arr];
        id descO = nil;
        while (descO = [iteratorDesc nextObject]) {
            NSLog(@"%@", descO);
        }
        
        NSLog(@"=========== 系统的迭代器 ===========");
        NSEnumerator *enumerator = [arr objectEnumerator];
        id obj = nil;
        while (obj = [enumerator nextObject]) {
            NSLog(@"%@", obj);
        }
        
        NSLog(@"=========== 系统的逆序迭代器 ===========");
        NSEnumerator *enumerator2 = [arr reverseObjectEnumerator];
        id obj2 = nil;
        while (obj2 = [enumerator2 nextObject]) {
            NSLog(@"%@", obj2);
        }
    }
    return 0;
}
