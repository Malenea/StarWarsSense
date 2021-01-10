//
//  DetailsSecondaryTypeHandler.swift
//  StarWarsSense
//
//  Created by Olivier Conan on 10/01/2021.
//  Copyright © 2021 OlivierConan. All rights reserved.
//

import Foundation

public enum SecondaryType {
    case planets
    case films
    case species
    case vehicles
    case starships
    case people
}

public enum ValueFormatterType {
    case text(String)
    case url(SecondaryType, String)
    case multiURL(SecondaryType, [String])
}

final class ValueFormatter {

    static func getFormatted(type: ValueFormatterType, completion: @escaping (String) -> Void) {
        switch type {
            case .text(let text):
                completion(text)
            case .url(let type, let url):
                guard let _ = URL(string: url) else { return }
                switch type {
                    case .planets:
                        PlanetsHandler.shared.getPlanet(url: url) { planet, error in
                            completion(planet?.name ?? "n/a")
                        }
                    case .films:
                        FilmsHandler.shared.getFilm(url: url) { film, error in
                            completion(film?.title ?? "n/a")
                        }
                    case .species:
                        SpeciesHandler.shared.getSpecie(url: url) { specie, error in
                            completion(specie?.name ?? "n/a")
                        }
                    case .vehicles:
                        VehiclesHandler.shared.getVehicle(url: url) { vehicle, error in
                            completion(vehicle?.name ?? "n/a")
                        }
                    case .starships:
                        StarshipsHandler.shared.getStarship(url: url) { starship, error in
                            completion(starship?.name ?? "n/a")
                        }
                    case .people:
                        PeopleHandler.shared.getCharacter(url: url) { character, error in
                            completion(character?.name ?? "n/a")
                        }
                }
            case .multiURL(let type, let urls):
                switch type {
                    case .planets:
                        var planets: [Planet] = []
                        var failCount: Int = 0
                        for url in urls {
                            PlanetsHandler.shared.getPlanet(url: url) { planet, error in
                                if let planet = planet {
                                    planets.append(planet)
                                    if planets.count == urls.count - failCount {
                                        completion((planets.map { $0.name }).joined(separator: "\n"))
                                    }
                                } else {
                                    failCount += 1
                                }
                            }
                        }
                    case .films:
                        var films: [Film] = []
                        var failCount: Int = 0
                        for url in urls {
                            FilmsHandler.shared.getFilm(url: url) { film, error in
                                if let film = film {
                                    films.append(film)
                                    if films.count == urls.count - failCount {
                                        completion((films.map { $0.title }).joined(separator: "\n"))
                                    }
                                } else {
                                    failCount += 1
                                }
                            }
                        }
                    case .species:
                        var species: [Specie] = []
                        var failCount: Int = 0
                        for url in urls {
                            SpeciesHandler.shared.getSpecie(url: url) { specie, error in
                                if let specie = specie {
                                    species.append(specie)
                                    if species.count == urls.count - failCount {
                                        completion((species.map { $0.name }).joined(separator: "\n"))
                                    }
                                } else {
                                    failCount += 1
                                }
                            }
                        }
                    case .vehicles:
                        var vehicles: [Vehicle] = []
                        var failCount: Int = 0
                        for url in urls {
                            VehiclesHandler.shared.getVehicle(url: url) { vehicle, error in
                                if let vehicle = vehicle {
                                    vehicles.append(vehicle)
                                    if vehicles.count == urls.count - failCount {
                                        completion((vehicles.map { $0.name }).joined(separator: "\n"))
                                    }
                                } else {
                                    failCount += 1
                                }
                            }
                        }
                    case .starships:
                        var starships: [Starship] = []
                        var failCount: Int = 0
                        for url in urls {
                            StarshipsHandler.shared.getStarship(url: url) { starship, error in
                                if let starship = starship {
                                    starships.append(starship)
                                    if starships.count == urls.count - failCount {
                                        completion((starships.map { $0.name }).joined(separator: "\n"))
                                    }
                                } else {
                                    failCount += 1
                                }
                            }
                        }
                    case .people:
                        var people: [Character] = []
                        var failCount: Int = 0
                        for url in urls {
                            PeopleHandler.shared.getCharacter(url: url) { character, error in
                                if let character = character {
                                    people.append(character)
                                    if people.count == urls.count - failCount {
                                        completion((people.map { $0.name }).joined(separator: "\n"))
                                    }
                                } else {
                                    failCount += 1
                                }
                            }
                        }
                }
        }
    }

}
