//
//  EKUserMO.h
//  university
//
//  Created by Kyralesov on 04.05.16.
//  Copyright © 2016 Kyralesov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *firstNames[] = {
    
    @"Spencer", @"Roger", @"Willis", @"Rodrigo", @"Quinton",
    @"Ward", @"Phillip", @"Gerry", @"Carlton", @"James",
    @"Roosevelt", @"Lewis", @"Andrew", @"Philip", @"Eldridge",
    @"Derrick", @"Randal", @"Jackson", @"Christopher", @"Dario",
    @"Les", @"Bernardo", @"Clyde", @"Ricardo", @"Stacey",
    @"Otha", @"Desmond", @"Rashad", @"Bret", @"Barton",
    @"Freddie", @"Levi", @"Jamie", @"Grover", @"Shelby",
    @"Wendell", @"Edmond", @"Brendan", @"Sanford", @"Samuel",
    @"Waylon", @"Kirk", @"Lacy", @"Van",@"Hans",
    @"William", @"Vance", @"Tommie", @"Kurtis", @"Gregorio",
    @"Shaunda", @"Mechelle", @"Mindy", @"Palmira", @"Samara",
    @"Marci", @"Nicole", @"Inge", @"Jo", @"Mabelle",
    @"Jeannine", @"Kathrin", @"Ginger", @"Yang", @"Iris",
    @"Meggan", @"Fredricka", @"Jackelyn", @"Dionna", @"Suanne",
    @"Marceline", @"Marguerita", @"Donita", @"Mallie", @"Luisa",
    @"Eun", @"Reagan", @"Tayna", @"Oliva", @"Kimberley",
    @"Iraida", @"Lizabeth", @"Yan", @"Myrtice", @"Lucienne",
    @"Gay", @"Justine", @"Ryann", @"Pearline", @"Wynell",
    @"Marine", @"Kimiko", @"Lashanda", @"Mattie", @"Leeann",
    @"Wilda", @"Eliza", @"Felipa", @"Michaela", @"Carlota"
    
};


static NSString *lastNames[] = {
    
    @"Ruf", @"Raco", @"Castiglione", @"Siegle", @"Byas",
    @"Klatt", @"Hogan", @"Vanmeter", @"Harbert", @"Petties",
    @"Laffoon", @"Finch", @"Wilford", @"Scovil", @"Gourlay",
    @"Parkin", @"Havlik", @"Foti", @"Gamez", @"Brighton",
    @"Borland", @"Petrin", @"Phillippe", @"Carlo", @"Walder",
    @"Mcnerney", @"Strasser",@"Delafuente", @"Mcenaney", @"Reny",
    @"Whittenburg", @"Gammons", @"Stamey", @"Youngblood", @"Alcala",
    @"Osborne", @"Pigeon", @"Weitz", @"Waite", @"Wester",
    @"Low", @"Besecker", @"Selander", @"Wolak", @"Maricle",
    @"Fritzler", @"Wheatley", @"Rasmussen", @"Register", @"Mullinax"
    
};

@interface EKUserMO : NSManagedObject



@end


NS_ASSUME_NONNULL_END

#import "EKUserMO+CoreDataProperties.h"
